# Schools
mcgill = School.create(name: 'McGill')

# Courses
c307 = Course.create(name: 'Web Development', faculty: 'COMP', number: '307', school: mcgill)
c551 = Course.create(name: 'Applied Machine Learning', faculty: 'COMP', number: '551', school: mcgill)
c273 = Course.create(name: 'Introduction To Computer Systems', faculty: 'COMP', number: '273', school: mcgill)
c206 = Course.create(name: 'Software Systems', faculty: 'COMP', number: '206', school: mcgill)
c330 = Course.create(name: 'Theory of Computation', faculty: 'COMP', number: '330', school: mcgill)
m318 = Course.create(name: 'Mathematical Logic', faculty: 'MATH', number: '318', school: mcgill)
# Teachers
jv = Teacher.create(name: 'Joseph Vybihal', school: mcgill)
jp = Teacher.create(name: 'Joelle Pineau', school: mcgill)
hh = Teacher.create(name: 'Hamed Hatami', school: mcgill)
ms = Teacher.create(name: 'Marcin Sabok', school: mcgill)

# Terms
f2016 = Term.create(year: '2016', season: 'Fall', school: mcgill)

# Teachings
Teaching.create(course: c307, teacher: jv, term: f2016)
Teaching.create(course: c551, teacher: jp, term: f2016)
Teaching.create(course: c330, teacher: hh, term: f2016)
Teaching.create(course: m318, teacher: ms, term: f2016)

# Default user
User.create(username: 'admin', password: 'root123', password_confirmation: 'root123')
