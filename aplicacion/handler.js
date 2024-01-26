'use strict';

module.exports.helloUser = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Hola usuario',
        input: event,
      },
      null,
      2
    ),
  };
};
