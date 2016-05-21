class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:payments) { Payment.includes(:student) }

end
