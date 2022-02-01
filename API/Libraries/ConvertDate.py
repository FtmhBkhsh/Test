import jdatetime

def Convert_time(createdAt):
    gregorian_date =createdAt.split("T")[0]
    gregorian_year_mounth_day =gregorian_date.split("-")
    jalali_date =  jdatetime.date.fromgregorian(day=int(gregorian_year_mounth_day[2]) ,month=int(gregorian_year_mounth_day[1]),year=int(gregorian_year_mounth_day[0]))
    #jalali_date format is year-mounth-day
    jalai_format_of_createdAt=str(jalali_date)+"T"+createdAt.split("T")[1]
    return jalai_format_of_createdAt

