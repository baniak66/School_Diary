require 'spec_helper'

feature 'User checks student payments' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment) { create :payment, student: student, month: "2016-01-01", payment_term: "2016-01-15" }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@href='/report/payments']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content '2016 January'
  end
end
