const AWS = require("aws-sdk");
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  const updateData = {
    id: event.id, 
    firstName: event.firstName,
    lastName: event.lastName
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Key: {
      id: updateData.id
    },
    UpdateExpression: "set firstName = :f, lastName = :l",
    ExpressionAttributeValues: {
      ":f": updateData.firstName,
      ":l": updateData.lastName
    },
    ReturnValues: "ALL_NEW"
  };

  try {
    const updatedData = await dynamoDB.update(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(updatedData.Attributes),
    };
  } catch (error) {
    console.error('Error updating item', error);
    return {
      statusCode: 500,
      body: JSON.stringify('Error updating item'),
    };
  }
};
