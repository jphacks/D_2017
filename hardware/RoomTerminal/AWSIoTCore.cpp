#include "AWSIoTCore.h"

ENTRY_RESULT entry_res = IDLE;

AWSGreenGrassIoT *greengrass;

char PUB_TOPIC_NAME[] = "entry/register";
char SUB_TOPIC_NAME[] = "entry/result";
char JSONPAYLOAD[] = "{ \"IDm\": \"%s\", \"mac_address\": \"%s\", \"timestamp\": %lu }";

static void subscribeCallback(int topicNameLen, char *topicName, int payloadLen, char *payLoad)
{
    String receivedPayload = payLoad;

    if (receivedPayload.indexOf("accept") > 0)
    {
        entry_res = ENTRY_RESULT::ACCEPT;
    }
    else if (receivedPayload.indexOf("exit") > 0)
    {
        entry_res = ENTRY_RESULT::EXIT;
    }
    else if (receivedPayload.indexOf("reject") > 0)
    {
        entry_res = ENTRY_RESULT::REJECT;
    }
    else
    {
        entry_res = ENTRY_RESULT::UNKNOWN;
    }
}

bool setupIoTCoreSubscribe()
{
    if (!greengrass->subscribe(SUB_TOPIC_NAME, subscribeCallback))
    {
        Serial.println("[Error] IoT Core subscribe Failed");
        return false;
    }

    Serial.println("[Info] IoT Core subscribe registered");
    return true;
}
