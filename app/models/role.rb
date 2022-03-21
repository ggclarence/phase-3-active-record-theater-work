class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        auditions.map do |audition|
            audition.location
        end
    end

    def lead
        lead = auditions.find do |audition|
            audition.hired
        end

        if (lead == nil)
            puts "No actor has been hired for this role"
        else
            lead
        end
    end

    def understudy
        lead = nil
        understudy = nil
        auditions.each do |audition|
            if audition.hired
                if lead == nil
                    lead = audition
                elsif understudy == nil
                    understudy = audition
                end
            end
        end

        if (understudy == nil)
            puts "No actor has been hired for this role"
        else
            understudy
        end
    end
end