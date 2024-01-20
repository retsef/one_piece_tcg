import LocalTime from 'local-time'

LocalTime.config.i18n.it = {
  date: {
    formats: { default: '%e %b %Y', thisYear: '%e %b' },
    abbrDayNames: ['Dom', 'Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab'],
    dayNames: ['Domenica', 'Lunedì', 'Martedì', 'Mercoledì', 'Giovedì', 'Venerdì', 'Sabato'],
    abbrMonthNames: ['Gen', 'Feb', 'Mar', 'Apr', 'Mag', 'Giu', 'Lug', 'Ago', 'Set', 'Ott', 'Nov', 'Dic'],
    monthNames: ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto', 'Settembre', 'Ottobre', 'Novembre', 'Dicembre'],
    on: 'il {date}',
    today: 'oggi',
    tomorrow: 'domani',
    yesterday: 'ieri'
  },
  time: {
    elapsed: '{time} fa',
    formats: { default: '%H:%M' },
    hour: 'ora',
    hours: 'ore',
    minute: 'minuto',
    minutes: 'minuti',
    second: 'secondo',
    seconds: 'secondi',
    singular: 'alle {time}',
    singularAn: 'alle {time}'
  },
  datetime: {
    at: '{date} alle {time}',
    formats: { default: '%e %B %Y alle %H:%M' }
  }
}
LocalTime.config.locale = 'it'
LocalTime.config.defaultLocale = 'it'

window.LocalTime = LocalTime
LocalTime.start()
