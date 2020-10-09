class ContentValidator < ActiveModel::Validator
    def validate(record)
        unless record.content.length >= 250
            record.errors[:content] << "Nah. That post isn't long enough."
        end
        unless record.summary.length < 250
            record.errors[:summary] << "Nah. That summary is too long, bruh."
        end
    end
end 