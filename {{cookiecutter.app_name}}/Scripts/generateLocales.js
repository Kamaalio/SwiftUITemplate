const Localize = require('@kamaal111/localize');

const en = require('../Locales/en');

const DEFAULT_LOCALE = 'en';

const locales = { en };

const keysFileTemplate = (input) => {
  return `//
//  Keys.swift
//
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

extension AppLocales {
    public enum Keys: String {
${input}
    }
}
`;
};

const localizableFileTemplate = (input) => {
  return `/*
  Localizable.strings


  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.

*/

${input}`;
};

const main = () => {
  const localize = new Localize(
    'Modules/AppLocales/Sources/AppLocales/Resources',
    'Modules/AppLocales/Sources/AppLocales/Keys.swift',
    locales,
    DEFAULT_LOCALE,
    2,
  );
  localize.setKeysTemplate(keysFileTemplate);
  localize.setLocaleFileTemplate(localizableFileTemplate);
  localize.generateFiles().then(console.log('Done localizing'));
};

main();

