from pymongo import MongoClient
url = "mongodb://admin:admin@cluster0-shard-00-00.b75yo.mongodb.net:27017,cluster0-shard-00-01.b75yo.mongodb.net:27017,cluster0-shard-00-02.b75yo.mongodb.net:27017/myFirstDatabase?ssl=true&replicaSet=atlas-11zqk8-shard-0&authSource=admin&retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech

students = db.students
student_list = students.find({})

print("\n -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
for doc in student_list:
    print(" Student ID: " + doc["student_id"] + "\n First Name: " + doc["first_name"] + "\n Last Name: " + doc["last_name"] + "\n")

result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Jenkins"}})
leroy = students.find_one({"student_id": "1007"})

print("\n -- DISPLAYING STUDENT DOCUMENT 1007 --")
print(" Student ID: " + leroy["student_id"] + "\n First Name: " + leroy["first_name"] + "\n Last Name: " + leroy["last_name"] + "\n")



input("\n\n End of program, press any key to continue...")
