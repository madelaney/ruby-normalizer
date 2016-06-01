class Normalizer
	def initialize(file, options = {})
		@source = file
		@options = options
		@env = environment

		parse
	end

	def parse
		content = File.read(@source)

		# Scan the content of the file, and search for *unique* variable names
		# that we need to do a search and replace for.
		#
		variables = content.scan(/\{\w+\}/).uniq

		variables.each do |var|
		  # Since the place holders are in the file like such {MY_VAR}, we can
		  # assume that the first character is the open bracket, and the last
		  # is the closing bracket so lets just trim those off.
		  #
		  env_var = var[1..-2]

		  if @env.key? env_var
		    content.gsub! var, @env[env_var].chomp

		  else
		    # NOTE: mdelaney
		    # I'm not too sure if we should fail, i.e. return a non zero, or just
		    # print out a message to the console. For the moment, we'll just print
		    # out a message to the console. Should we want to fail the build that's
		    # a trivial change to make.
		    #
		    puts format('WARNING: No such environment variable %s', env_var)
		  end
		end

		output_file = @options[:output] ||= @source
		File.write(output_file, content)
	end

	private

		def environment
			env = ENV.to_h
			env.merge! load_properties(@options[:properties])
		end

		def load_properties(file)
		  props = {}
		  return props if file.nil?

		  properties = File.read(file)
		  properties.each_line do |line|
		    parts = line.split '='
		    props[parts[0]] = parts[1]
		  end

	  	props
		end
end