import { readFileSync } from "fs";
import { join } from "path";

const getConfig = () => {
    let config;
    
    try {
        config = JSON.parse(readFileSync(join(process.env.HOME, ".eww-weather.json")));    
    } catch(e) { config = e.name; }

    return config;
}

const getCurrentWeather = () => {
    const config = getConfig();

    try {
        fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${config.lat}&lon=${config.lon}&units=${config.units}&appid=${config.appid}`)
           .then((response) => response.json())
           .then((body) => {
                process.stdout.write(JSON.stringify(body));
           })
    } catch(e) { process.stdout.write(e.name); }
}

const getForecast = () => {
    const config = getConfig();

    try {
        fetch(`https://api.openweathermap.org/data/2.5/forecast?lat=${config.lat}&lon=${config.lon}&appid=${config.appid}`)
           .then((response) => response.json())
           .then((body) => {
                process.stdout.write(JSON.stringify(body));
           })
    } catch(e) { process.stdout.write(e.name); }
}

getForecast();