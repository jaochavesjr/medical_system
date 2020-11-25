class AppointmentIntervalValidator < ActiveModel::Validator

  def validate(record)
    unless record.starts_at.present? || record.ends_at.present?
      return true
    end
    @starts_at = record.starts_at
    @ends_at = record.ends_at
    if @starts_at < @ends_at
      record.errors[:base] << "date ends must be greater than start"
    elsif  @starts_at.hour < 9 || @starts_at.hour == 12 || @starts_at.hour > 17
      record.errors[:base] << "start time out of office hours"
    elsif  @ends_at.hour < 9 || @ends_at.hour == 12 || @ends_at.hour > 17
      record.errors[:base] << "finish hour out of office hours"
    elsif appointment_time > 30 || appointment_time == 0.0
      record.errors[:base] << "time between 1 min and 30 min"
    else
      true
    end
  end

  def appointment_time
    (@ends_at - @starts_at)/1.minute
  end
end
