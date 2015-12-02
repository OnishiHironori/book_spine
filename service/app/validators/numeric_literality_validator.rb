class NumericLiteralityValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /\A[0-9]+\z/
			record.errors[attribute] << (options[:message] || "is not numeric literal")
		end
	end
end
