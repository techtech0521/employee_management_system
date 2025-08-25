namespace :employee_number do
  desc "Reset all employee_number to continuous 3-digit numbers starting from 001"
  task reset: :environment do
    users = User.order(:id)
    users.each_with_index do |user, idx|
      new_number = format('%03d', idx + 1)
      user.update_column(:employee_number, new_number)
      puts "User##{user.id} -> #{new_number}"
    end
    puts "Reset #{users.count} users' employee_number to continuous 3-digit numbers."
  end
end