[ANGULAR WORKS WITH TYPESCRIPT]

# TO INSTALL ANGULAR PACKAGE
- npm i -g @angular/cli
  - ng version

## EVERYTHING WORKS WITH ANGULAR CLI
## CREATE NEW PROJECT
- ng new

  > then(select the assets)

- Enable Server-Side Rendering (SSR) Static Site Generation (SSG) -> CEO for applications, pre renders

# START SERVER
- ng serve {--port 4500} || npm start

## Configurar HttpClientModule
in app.config.ts

add:
"
import { provideHttpClient } from '@angular/common/http';

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideClientHydration(withEventReplay()),
    provideHttpClient()
  ]
};
"
# CREATE APP MODULES
## CREATE COMPONENTS
- ng generate component "path [components/home]" || ng g c "path"

## CREATE INTERFACES (define data structure expected of an object)
- ng generate interface "path [components/housinglocation]"

## CREATE SERVICES (can be used in other components)
- ng generate service "path [components/housing]" --skip-tests

https://www.youtube.com/watch?v=gAU6ZhbPQIM
