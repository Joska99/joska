from datetime import date, timedelta
from requests import get


def get_api(city: str = "london") -> list:
    """
        Get API from visualcrossing.com 
        And return LIST[{},{}] of DICTIONARIES 
    """
    # Key from account
    key = "95BE9EDAD2ZQT76JUBUVL7UVR"

    # From now - +7 days
    days = 7
    start_date = date.today()
    end_date = start_date + timedelta(days=days)

    # City default - london
    city = city

    # URL for API
    url = f"https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/{city}/{start_date}/{end_date}?unitGroup=metric&key={key}"

    # GET REQUEST
    response = get(url).json()

    # List for appending dicts
    response_list = []

    for i in range(0, days+1):
        # Create dict and append to list
        one_day = {}
        one_day["address"] = response["address"].capitalize()
        one_day["resolvedAddress"] = response["resolvedAddress"]
        one_day["datetime"] = response["days"][i]["datetime"]
        one_day["temp"] = response["days"][i]["temp"]
        one_day["humidity"] = response["days"][i]["humidity"]
        one_day["tempmax"] = response["days"][i]["tempmax"]
        one_day["tempmin"] = response["days"][i]["tempmin"]
        response_list.append(one_day)

    return response_list


if __name__ == "__main__":
    print(get_api("tel aviv"))
    print(get_api())
