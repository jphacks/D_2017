#ifndef _AWSGIOTCORE_H_
#define _AWSGIOTCORE_H_

#include <Arduino.h>
#include <AWSGreenGrassIoT.h>

enum ENTRY_RESULT
{
    IDLE,
    ASKING,
    ACCEPT,
    EXIT,
    REJECT,
    UNKNOWN,
};

extern ENTRY_RESULT entry_res;

extern AWSGreenGrassIoT *greengrass;

extern const char aws_root_ca_pem[];
extern const char certificate_pem_crt[];
extern const char private_pem_key[];
extern const char AWSIOTURL[];
extern const char THING[];

extern char PUB_TOPIC_NAME[];
extern char SUB_TOPIC_NAME[];
extern char JSONPAYLOAD[];

static void subscribeCallback(int topicNameLen, char *topicName, int payloadLen, char *payLoad);
bool setupIoTCoreSubscribe();

#endif
