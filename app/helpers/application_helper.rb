module ApplicationHelper

    def get_doctor
        User.where(role: "Doctor").pluck(:name, :id)
    end

    def find_user(id)
        User.find_by(id: id).name
    end
    
    
end
