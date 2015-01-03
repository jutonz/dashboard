class Note < ActiveRecord::Base
  def created_on
    date = created_at
    formatted_date = ''
    if date.today?
      formatted_date += 'today '
    else 
      formatted_date += "on "
      formatted_date += date.to_formatted_s :just_date
      formatted_date += ' '
    end
    formatted_date += 'at '
    formatted_date += date.to_formatted_s :time
  end
end
