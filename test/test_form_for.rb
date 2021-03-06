# frozen_string_literal: true

require 'test_helper'

class TestFormFor < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_form_for_generates_form_simple
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    expected_form = fixture_file('form_simple_w_url.html').strip
    generated_form = HexletCode.form_for user, url: '/users'
    assert_equal expected_form, generated_form

    expected_form = fixture_file('form_simple_wo_url.html').strip
    generated_form = HexletCode.form_for user
    assert_equal expected_form, generated_form
  end

  def test_form_for_generates_form_w_input
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    expected_form = fixture_file('form_w_input.html').strip
    generated_form = HexletCode.form_for user do |f|
      f.input :name
    end
    assert_equal expected_form, generated_form
  end

  def test_form_for_generates_form_w_testarea
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    expected_form = fixture_file('form_w_testarea.html').strip
    generated_form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected_form, generated_form
  end

  def test_form_for_generates_form_w_submit
    user = User.new job: 'hexlet'

    expected_form = File.read('./test/fixtures/form_w_submit.html').strip
    generated_form = HexletCode.form_for user do |f|
      f.submit 'Go!'
    end
    assert_equal expected_form, generated_form
  end

  def test_form_for_generates_form_w_default_submit
    user = User.new job: 'hexlet'

    expected_form = fixture_file('form_w_default_submit.html').strip
    generated_form = HexletCode.form_for user do |f|
      f.input :name
      f.submit
    end
    assert_equal expected_form, generated_form
  end

  def test_form_for_throws_error_on_wrong_field
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    assert_raises(NoMethodError) do
      HexletCode.form_for user do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
