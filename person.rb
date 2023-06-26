class Person
initialize(name = "unknown",age,parent_permission = true)
@name = name
@age = age
@parent_permission = parent_permission
@id = Random.rand(1..1000)
end

def id
  @id
end

def name
  @name
end

def age
  @age
end

def name=(value)
  @name = value
end

def age=(value)
  @age = value
end

private
def of_age?
  @age >= 18
end

def can_use_services?
  of_age? || @parent_permission
end
end
