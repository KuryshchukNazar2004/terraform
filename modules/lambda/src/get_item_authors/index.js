const AWS = require("aws-sdk");
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  const itemId = event.id;

  const params = {
    TableName: process.env.TABLE_NAME,
    Key: {
      id: itemId
    }
  };

  try {
    const data = await dynamoDB.get(params).promise();

    if (!data.Item) {
      return {
        statusCode: 404,
        body: JSON.stringify({ message: 'Item not found' }),
      };
    }

    const formattedData = {
      Items: [
        {
          id: { S: data.Item.id },
          firstName: { S: data.Item.firstName },
          lastName: { S: data.Item.lastName }
        }
      ]
    };

    return {
      statusCode: 200,
      body: JSON.stringify(formattedData),
    };
  } catch (error) {
    console.error('Error getting item', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error getting item' }),
    };
  }
};

