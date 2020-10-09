class NameValidator < ActiveModel::Validator
    def validate(record)
        unless record.name != nil
            record.errors[:name] << "Sorry, authors need a name."
        end
        unless Author.all.map{|author| author.name}.exclude?(record.name)
            record.errors[:name] << "Nope. That name already exists. Nice try."
        end
    end
end 