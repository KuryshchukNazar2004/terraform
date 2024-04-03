const AWS = require('aws-sdk');
const dynamoDB = new AWS.DynamoDB();

exports.handler = async (event, context) => {
    const id = event.id; 
    const params = {
        TableName: process.env.TABLE_NAME,
        Key: {
            'id': { S: id }
        }
    };

    try {
        await dynamoDB.deleteItem(params).promise();
        return {
            statusCode: 200,
            body: JSON.stringify('Item deleted successfully'),
        };
    } catch (err) {
        console.error('Error deleting item', err);
        return {
            statusCode: 500,
            body: JSON.stringify('Error deleting item'),
        };
    }
};
