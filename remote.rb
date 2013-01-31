require 'net/ssh'
require 'colorize'
require File.expand_path(File.join(File.dirname(__FILE__), 'commandline.rb'))

module Remote

	# remotely log in and execute command on the given host
	def self.distribute(host, command, user=nil, pass=nil)
		if user.nil?
			Net::SSH.start(host, '[redacted]', :paranoid => false) do |ssh|
				puts "Doing #{host}... " + (ssh.exec!(command).green || "Error: Command did not go through")
		end
		else
			Net::SSH.start(host, user, :password => pass, :paranoid => false) do |ssh|
				puts "Doing #{host}... " + (ssh.exec!(command).green || "Error: Command did not go through")
			end
		end
	end

end

