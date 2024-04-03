const AWS = require("aws-sdk");
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  const dataToAdd = {
    id: event.id, 
    firstName: event.firstName,
    lastName: event.lastName
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Item: dataToAdd
  };

  try {
    await dynamoDB.put(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify('Item added successfully'),
    };
  } catch (error) {
    console.error('Error adding item', error);
    return {
      statusCode: 500,
      body: JSON.stringify('Error adding item'),
    };
  }
};
