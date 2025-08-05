# Notice:
If you plan to test the collection and processing of logs, you need to copy and paste a large amount of the above log content into the test-logs/test.log file. 
Because filebeat has a collection limit, it will only collect files that exceed 1KB in size.


```
{"log.level":"warn","@timestamp":"2025-07-31T07:07:58.532Z","log.logger":"input.scanner","log.origin":{"function":"github.com/elastic/beats/v7/filebeat/input/filestream.(*fileScanner).GetFiles","file.name":"filestream/fswatch.go","file.line":421},"message":"1 file is too small to be ingested, files need to be at least 1024 in size for ingestion to start. To change this behaviour set 'prospector.scanner.fingerprint.length' and 'prospector.scanner.fingerprint.offset'. Enable debug logging to see all file names.","service.name":"filebeat","filestream_id":"some-old-files","ecs.version":"1.6.0"}
```



