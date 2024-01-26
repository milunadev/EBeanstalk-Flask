'use strict';

module.exports.helloUser = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Hola! Este es el resultado de la prueba tecnica -> 10/10 :D',
        input: event,
      },
      null,
      2
    ),
  };
};
