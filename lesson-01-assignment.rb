# QUESTION 1
# find the coding class id for 'intro to programming'
intro_class = CodingClass.find_by(title:'Intro to Programming')
# checking the id
intro_class.id
# find the trimester id for the spring semester 2025
spring_2025 = Trimester.find_by(year: '2025', term: 'Spring')
# checking that id
spring_2025.id
# find the course id for the intro to programming course in spring 2025
intro_course = Course.find_by(coding_class_id: intro_class.id, trimester_id: spring_2025.id)
# check that id
intro_course.id
# find the enrollment for that course
enrollments = Enrollments.where(course_id: intro_course.id)
# check number of enrollments, for fun
enrollments.count
# getting the students
student_emails = enrollments.map {|enrollment| enrollment.student.email } 
# printing the emails
puts student_emails
# lastly, getting two student emails
two_students = enrollments.limit(2).map {|enrollment| [enrollment.student.id, enrollment.student.email]}
# this printed strangely
puts two_students
# 41
# bart@jaskolski.test
# 42
# annis@funk-cummerata.test

# QUESTION 2
# I have all the ids above to get started
# find the enrollments where the final grade is missing
incomplete_enrollments = Enrollment.where(course_id: intro_course.id, final_grade: nil)
# find the mentor ids for the enrollments
mentor_ids = MentorEnrollmentAssignment.where(enrollment_id: incomplete_enrollments.pluck(:id)).pluck(:mentor_id)
# now get the mentor ids
doc-rails(dev)* mentors.each do |mentor|
doc-rails(dev)*   puts mentor.id, mentor.email
doc-rails(dev)> end
