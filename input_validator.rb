class InputValidator
  def validate_book_title(title)
    if title.length < 5
      puts 'Title must be at least 5 characters long'
      validate_book_title(gets.chomp)
    else
      title
    end
  end

  def validate_book_author(author)
    if author.length < 3
      puts 'Author must be at least 3 characters long'
      validate_book_author(gets.chomp)
    else
      author
    end
  end

  def validate_person_name(name)
    if name.length < 3
      puts 'Name must be at least 3 characters long'
      validate_person_name(gets.chomp)
    else
      name
    end
  end

  def validate_person_age(age)
    if age < 18
      puts 'Person must be at least 18 years old'
      validate_person_age(gets.chomp.to_i)
    else
      age
    end
  end

  def validate_person_type(person_type)
    if person_type != 1 && person_type != 2
      puts 'Person type must be 1 or 2'
      validate_person_type(gets.chomp.to_i)
    else
      person_type
    end
  end

  def validate_parent_permission(parent_permission)
    if parent_permission != 'y' && parent_permission != 'n'
      puts 'Parent permission must be true or false'
      validate_parent_permission(gets.chomp)
    else
      parent_permission
    end
  end

  def validate_rental_date(date)
    if date.length == 10
      date
    else
      puts 'Date must have 10 characters'
      validate_rental_date(gets.chomp)
    end
  end

  def validate_rental_book(book)
    if book.instance_of?(Book)
      book
    else
      puts 'Book must be a Book instance'
      nil
    end
  end

  def validate_rental_person(person)
    if person.instance_of?(Person)
      person
    else
      puts 'Person must be a Person instance'
      nil
    end
  end

  def validate_rental_person_age(person_age)
    if person_age < 18
      puts 'Person must be at least 18 years old'
      validate_rental_person_age(gets.chomp.to_i)
    else
      person_age
    end
  end

  def validate_specialization(specialization)
    if specialization.length < 3
      puts 'Specialization must be at least 3 characters long'
      validate_specialization(gets.chomp)
    else
      specialization
    end
  end
end
