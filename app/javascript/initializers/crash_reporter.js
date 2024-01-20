import Sentry from '@sentry/browser'
import { getMetaValue } from 'helpers'

Sentry.init({
  dsn: 'https://3f875ea59b234731aa19ba94f869662d@o4505000559640576.ingest.sentry.io/4505000577859585',
  environment: getMetaValue('environment'),
  integrations: [new Sentry.BrowserTracing()],
  tunnel: '/crash_report',
  tracePropagationTargets: ['localhost', /^https:\/\/tenutobene\.it/]
})
