from pymongo import MongoClient

url= "mongodb://admin:admin@cluster0-shard-00-00.b75yo.mongodb.net:27017,cluster0-shard-00-01.b75yo.mongodb.net:27017,cluster0-shard-00-02.b75yo.mongodb.net:27017/myFirstDatabase?ssl=true&replicaSet=atlas-11zqk8-shard-0&authSource=admin&retryWrites=true&w=majority"

client = MongoClient(url)
db= client.pytech

leroy = {
    "student_id": "1007",
    "first_name": "Leroy",
    "last_name": "Jenkins"
}

dave = {
    "student_id": "1008",
    "first_name": "Dave",
    "last_name": "Batista"
}

stuart = {
    "student_id": "1009",
    "first_name": "Stuart",
    "last_name": "Lasagna"
}

students = db.students

print("\n -- INSERT STATEMENTS --")
leroy_student_id = students.insert_one(leroy).inserted_id
print(" Inserted Student record Leroy Jenkins into students collection with document_id " +str(leroy_student_id))

dave_student_id = students.insert_one(dave).inserted_id
print(" Inserted student record Dave Batista into the students collection with document_id" + str(dave_student_id))

stuart_student_id = students.insert_one(stuart).inserted_id
print(" Inserted student record Stuart Lasagna into the students collection with document_id " + str(stuart_student_id))

input("\n\n End of Program, press any key to exit... ")
