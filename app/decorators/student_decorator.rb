class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    subject_item.subject_item_notes.empty? ? "0.00" :
    "%.2f" % subject_item.subject_item_notes.average(:value)
  end

  def full_name_with_birth_date
    "#{first_name} #{last_name} #{birthdate.strftime('%Y-%m_%d') if birthdate.present?}"
  end
end
