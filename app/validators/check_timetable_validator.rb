class CheckTimetableValidator < ActiveModel::Validator

  def validate(record)
    start_date = Appointment.where('starts_at < ?', record.starts_at).where('ends_at > ?', record.starts_at)
    end_date = Appointment.where('starts_at < ?', record.ends_at).where('ends_at > ?', record.ends_at)
    if start_date.count > 0 || end_date.count > 0
      record.errors[:base] << "this time already has an appointment"
    end
  end
end
