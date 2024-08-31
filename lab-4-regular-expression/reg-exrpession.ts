import * as fs from 'fs';
import * as path from 'path';

type Method = "GET" | "POST" | "PUT" | "DELETE" | "PATCH" | "HEAD" | "OPTIONS";
interface Log {
    timestamp: string;
    ip: string;
    method: Method;
    path: string;
    http_version: string;
    return_code: number;
    body_byte: number;
    http_referer: string;
    http_user_agent: string;
}

const logRegex = /^(\S+) - - \[(.*?)\] "(GET|POST|PUT|DELETE|PATCH|HEAD|OPTIONS) (.*?) (HTTP\/\d\.\d)" (\d{3}) (\d+) "(.*?)" "(.*?)" "-"/;

const convertLogToJSON = (log: string): Log | null => {
    const match = log.match(logRegex)
    if (match) {
        const [, ip, timestamp, method, path, http_version, return_code, body_byte, http_referer, http_user_agent] = match
        const httpMethod: Method = method as Method
        return {
            timestamp,
            ip,
            method: httpMethod,
            path,
            http_version,
            return_code: parseInt(return_code),
            body_byte: parseInt(body_byte),
            http_referer,
            http_user_agent,
        }
    }
    return null
}
const readLogFile = (filePath: string): string[] => {
    const absolutePath = path.resolve(filePath)
    // console.log(absolutePath);
    const fileContent = fs.readFileSync(absolutePath, 'utf-8')

    return fileContent.split('\r\n').filter(line => line.trim() !== '')
}
const convertLogFileToJSON = (filePath: string): Log[] => {
    const logs = readLogFile(filePath);
    return logs.map(convertLogToJSON).filter((entry): entry is Log => entry !== null);
}
const saveToJSONFile = (data: Log[], outputFilePath: string) => {
    if (fs.existsSync(outputFilePath)) {
        fs.unlinkSync(outputFilePath)
    }
    // save file
    fs.writeFileSync(outputFilePath, JSON.stringify(data, null, 2), "utf-8")
}

function main() {
    const inputFilePath = 'exam.log'
    const outputFilePath = 'log.json'

    const logEntries = convertLogFileToJSON(inputFilePath);
    saveToJSONFile(logEntries, outputFilePath)
}

main()


