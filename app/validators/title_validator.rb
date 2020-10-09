class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title != nil
            record.errors[:title] << "Sorry, posts need a title."
        end
    end
end 

