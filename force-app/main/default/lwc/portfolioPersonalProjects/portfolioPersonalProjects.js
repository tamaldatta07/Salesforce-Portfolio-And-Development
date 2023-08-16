import { LightningElement } from 'lwc';
import PortfolioAssets from '@salesforce/resourceUrl/PortfolioAssets'
export default class PortfolioPersonalProjects extends LightningElement {
    BMICalculator = `${PortfolioAssets}/PortfolioAssets/Projects/BMICalculator.png`
    AlarmClock = `${PortfolioAssets}/PortfolioAssets/Projects/AlarmClock.png`
    CurrencyCalculator = `${PortfolioAssets}/PortfolioAssets/Projects/CurrencyCalculator.png`
    NoteApp = `${PortfolioAssets}/PortfolioAssets/Projects/NoteTakingApp.png`

    projects=[
        {
            "name":"BMI Calculator App",
            "img":this.BMICalculator,
            "link":"https://cunning-raccoon-an3bc9-dev-ed.trailblaze.my.site.com/bmi-calculator"
        },
        {
            "name":"Alarm Clock App",
            "img":this.AlarmClock,
            "link":"https://cunning-raccoon-an3bc9-dev-ed.trailblaze.my.site.com/alarm-clock"
        },
        {
            "name":"Curreny Converter App",
            "img":this.CurrencyCalculator,
            "link":"https://cunning-raccoon-an3bc9-dev-ed.trailblaze.my.site.com/currency-converter"
        },
        {
            "name":"Note Taking App",
            "img":this.NoteApp,
            "link":"https://cunning-raccoon-an3bc9-dev-ed.trailblaze.my.site.com/note-taking-app"
        }
    ]
}