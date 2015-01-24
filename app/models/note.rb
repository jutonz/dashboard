class Note < ActiveRecord::Base

  validates :text, presence: true

  def formatted_creation_date
    date = created_at
    formatted_date = ''
    if date.today?
      formatted_date += 'today'
    elsif date >= 2.days.ago
      formatted_date += 'yesterday'
    else 
      formatted_date += "on "
      formatted_date += date.to_formatted_s :just_date
    end
  end

  def text_abridged
    abridged = ''

    if text.split.size <= 20
      abridged = text
    else
      abridged = "#{text.split[0..19].join(' ')}..."
    end

    if abridged.size >= 300
      abridged = "#{abridged[0..299]}..."
    end

    return abridged
  end
end
