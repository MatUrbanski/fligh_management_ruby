# frozen_string_literal: true

# rubocop:disable Style/Documentation
class SeatsGenerator
  def create_seats(rows, seats_in_row, first_row_number)
    seats            = []
    seats_letters    = ('A'..'Z').first(seats_in_row)
    final_row_number = (first_row_number + rows) - 1
    rows             = [*(first_row_number..final_row_number)]

    rows.each do |row|
      seats_letters.each do |seat|
        seats << "#{row}#{seat}"
      end
    end

    seats
  end
end
# rubocop:enable Style/Documentation
