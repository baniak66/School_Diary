class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    subject_item.subject_item_notes.empty? ? "0.00" :
    "%.2f" % subject_item.subject_item_notes.average(:value)
  end
end
