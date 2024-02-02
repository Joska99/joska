from flask import Flask, render_template, request, redirect
from back import get_api

app = Flask(__name__)


@app.route("/")
def root():
    """
        Root redirect to /home
    """
    return redirect("home")


# Defining the home page of our site
@app.route("/home", methods=['GET', 'POST'])
def home():
    """
        Home HTML page with input from user
    """
    # If form submitted, then redirect to a city page
    if request.method == "POST":
        return redirect("city")

    return render_template('home.html', name="Joseph", title="weather-home")


@app.route("/city", methods=['GET', 'POST'])
def user():
    """
        HTML page with weather stat 7 days forward
    """
    city_input = request.form.get("city_input").capitalize()

    # Test for empty input
    if city_input == "":
        city_input = "London"

    try:
        # Use Back module to get API
        list_days = get_api(city_input)
    except Exception:
        return redirect("error")

    return render_template('city.html',  city=city_input, title=city_input, list=list_days, back="/")


@app.route("/error")
def err():
    """
        Error page
    """
    return render_template("error.html",  title="error-page", back="/")


if __name__ == "__main__":
    app.run(port=8080, debug=True)
