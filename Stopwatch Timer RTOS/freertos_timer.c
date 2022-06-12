/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include "stdio.h"
#include "stdlib.h"
#define TIMER_ID	1
#define DELAY_1_10_SECOND 100UL

///-----------------------------------------------------------/

/* The Tx and Rx tasks as described at the top of this file. */
static void vTimerCallback( TimerHandle_t pxTimer );
///-----------------------------------------------------------/

// Timer Handle
static TimerHandle_t xTimer = NULL;


volatile  long lCount=0,temp_count=0;
volatile  long timer_val=0;
int timer_started = 0x0;
int reset = 0x0;
int flag=-1;
static TaskHandle_t xMyKeyControl;


static void prvMyKeyControl( void *pvParameters )
{

	for( ;; )
	{

		char pressed = getchar();

		int asic =pressed;
		if( asic == 13 && flag==-1){
			temp_count=0;
			timer_started = 0x1;
			flag=0;
			xil_printf("Stopwatch Started");
		}
		else{
			timer_started=0x00;
			flag=-1;
			xil_printf("Stopwatch Stopped");
		}
		if (asic == 114){
			timer_started=0x0;
			reset=0x1;
			xil_printf("Stopwatch Reset");
		}


	}
	vTaskDelete(NULL);

}

int main( void )
{
	const TickType_t x1_10seconds = pdMS_TO_TICKS( DELAY_1_10_SECOND );

	// Set stdio buffer from uart
	setvbuf(stdin, NULL, _IONBF, 0);

	xil_printf( "\r\nECPS209-FreeRTOS-Timer (enter:start/stop r:reset)\r\n" );
	xTaskCreate( prvMyKeyControl,
				 ( const char * ) "MyKeyControl",
				 configMINIMAL_STACK_SIZE,
				 NULL,
				 tskIDLE_PRIORITY + 3,
				 &xMyKeyControl );

	xTimer = xTimerCreate( (const char *) "Timer",
							x1_10seconds,
							pdTRUE,
							(void *) TIMER_ID,
							vTimerCallback);



	xTimerStart( xTimer, 0 );

	vTaskStartScheduler();

	for( ;; );
}


static void vTimerCallback( TimerHandle_t pxTimer )
{
// condition to print current stopwatch on the screen every second
	if((temp_count==10)){
			temp_count=0;
			xil_printf("%02d:%02d:%02d\r\n", (timer_val/600)%60,(timer_val/10)%60 ,(timer_val%10)*10);
		}
	temp_count++;
	// condition if stopwatch is started i.e., start/stop button is pressed
	if(timer_started){
		timer_val = ++lCount;
		}
// condition if stopwatch is reset i.e., reset button is pressed
	if(reset){
		timer_val = 0;
		reset=0x0;
		lCount=0;
		temp_count=0;
		}
}
