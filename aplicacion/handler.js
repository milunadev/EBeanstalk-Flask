'use strict';

module.exports.helloUser = async (event) => {
  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Holaaaa usuario',
        input: event,
      },
      null,
      2
    ),
  };
};
