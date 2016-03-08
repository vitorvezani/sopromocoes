require 'roo'

class CVSFileReaderService
	instance_methods.each { |meth| undef_method(meth) unless meth =~ /\A__/ }
	
	def initialize(file)
		@file = file
	end
	
	def getPromotions()
	end

	def getCoupons()
	end
	
end