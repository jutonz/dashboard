require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'saves' do
    assert notes(:correct).save, 'Failed to save note'
    assert_equal 'correct', notes(:correct).text, 'Did not save text correctly'
  end

  test 'creation date today' do
    assert_equal 'today', notes(:correct).formatted_creation_date, 'Did not display \'today\' as creation date'
  end

  test 'creation date yesterday' do
    assert_equal 'yesterday', notes(:yesterday).formatted_creation_date, 'Did not display \'yesterday\' as creation date'
  end

  test 'creation date five days ago' do
    assert_equal "on #{5.days.ago.to_formatted_s(:just_date)}", notes(:five_days_ago).formatted_creation_date, 'Did not correctly display date of five days ago'
  end

  test 'save requires title' do
    assert_not notes(:no_text).save, 'Saved note without text'
  end

end
