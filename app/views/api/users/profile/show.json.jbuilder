json.key_format! camelize: :lower

json.result "ok"

json.message "Get user profile sucess"

json.data do

  json.profile do

    json.first_name  @profile.first_name || ""

    json.last_name  @profile.last_name || ""

    json.biography  @profile.biography || ""

    json.padron  @academic_info.padron || ""

    json.career @academic_info.carreer || ""

    json.location do
      json.latitude @profile.try(:location).try(:latitude) || ""
      json.longitude @profile.try(:location).try(:longitude) || ""
    end

    json.nationality  @nationality.nationality || ""

    json.city  @city.name || ""

    json.phone @phone.number || ""

    json.jobs @jobs do |job|
      json.id  job.try(:id) || ""
      json.company  job.try(:company) || ""
      json.position  job.try(:position) || ""
      json.date_interval do
        json.init  job.try(:date_interval).try(:init) || ""
        json.end  job.try(:date_interval).try(:end) || ""
      end
    end

    json.educations @educations do |education|
      json.id  education.try(:id) || ""
      json.diploma  education.try(:diploma) || ""
      json.institute do
        json.id   education.try(:institute).try(:id) || ""
        json.name  education.try(:institute).try(:name) || ""
      end
      json.date_interval do
        json.init  education.try(:date_interval).try(:init) || ""
        json.end  education.try(:date_interval).try(:end) || ""
      end
    end

  end

end
