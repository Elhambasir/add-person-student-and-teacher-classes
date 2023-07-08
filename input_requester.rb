class InputRequester
  def ask_for_book_title
    print 'Title:'
    gets.chomp
  end

  def ask_for_book_author
    print 'Author:'
    gets.chomp
  end

  def ask_for_person_name
    print 'Name:'
    gets.chomp
  end

  def ask_for_person_age
    print 'Age:'
    gets.chomp.to_i
  end

  def ask_for_person_type
    puts 'Choose a person type (1 - Student, 2 - Teacher):'
    gets.chomp.to_i
  end

  def ask_for_parent_permission
    print 'Parent permission? (y/n) '
    gets.chomp
  end

  def ask_for_rental_date
    print 'Date in format yyyy/mm/dd:'
    gets.chomp
  end

  def ask_for_rental_book_index
    puts 'Choose a book from the list by number'
    gets.chomp.to_i
  end

  def ask_for_rental_person_index
    puts 'Choose a person from the list by number:'
    gets.chomp.to_i
  end

  def ask_for_teacher_specialization
    print 'Specialization:'
    gets.chomp
  end

  def ask_for_rental_person_id
    print 'ID of person: '
    gets.chomp.to_i
  end
end
