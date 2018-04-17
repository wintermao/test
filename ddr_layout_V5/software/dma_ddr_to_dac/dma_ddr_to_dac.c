/*
 * dma_test.c
 *
 *  Created on: 2018-2-4
 *      Author: mmh
 */


#include "system.h"
#include "sys/alt_timestamp.h"          // Interval Timer
#include "alt_types.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include "sys/alt_dma.h"
#include "clk_gen.h"
#include "clk_device.h"

static volatile int tx_done = 0;

//callback funtion
static void done (void* handle)
{
    tx_done=1;
}

int main()
{
	clk_gen_dev dev_clk;
	alt_u32 t0,t1,dt;
  alt_u32 i,timestamp_freq;
  alt_u32 *ddr_dword1,*ddr_dword2;
  alt_u32 offset_source,offset_dest,base_source,base_dest,size_byte;
  //����DMA�ŵ�
  alt_dma_txchan txchan;
  //blink led
  clk_gen_init(&dev_clk,CLK_GEN_BASE);
  clk_gen_write(&dev_clk,LIGHT,ALT_CPU_CPU_FREQ);
  clk_gen_write(&dev_clk,DAC1,54);	//set DA freq to 1M

  //DDR2_BASE
  base_source=DDR2_BASE;
  base_dest=DAC2904_1_BASE;
  offset_source=0x1000000;
  offset_dest=0x000000;
  size_byte=0x1000;

  ddr_dword1=base_source+offset_source;
  ddr_dword2=base_dest+offset_dest;
	for(i=0;i<size_byte/4;i++)		//generate data,size is 1M byte
	{
	  *ddr_dword1=i*16;
	  ddr_dword1++;
	}
  timestamp_freq=alt_timestamp_freq();
  printf("system freq= %ld Hz\n", timestamp_freq);
  alt_timestamp_start();

	 //-----------------------------------------------------------
	 //�򿪷���ͨ��
	 if ((txchan = alt_dma_txchan_open("/dev/dma_0")) == NULL)
	 {
		 printf ("Failed to open transmit channel /dev/dma_0\n");
		 exit (1);
	 }
	 else
		 printf("�򿪷���ͨ��.\n");

	//start send
	ddr_dword1=base_source+offset_source;
	alt_dma_txchan_ioctl(txchan,  ALT_DMA_SET_MODE_32, NULL);
	alt_dma_txchan_ioctl(txchan,  ALT_DMA_TX_ONLY_ON, ddr_dword2);
	if (alt_dma_txchan_send(    txchan,
							 ddr_dword1,
							 size_byte,
							 done,
							  NULL) < 0)
	{
	  printf ("Failed to post transmit request.\n");
	  exit (1);
	}
	else
	{
	 t0 = alt_timestamp();
	 printf("start send.\n");
	}
     //-----------------------------------------------------------
     /* �ȴ����ͽ��� */
	/*
     while (!tx_done);
     t1 = alt_timestamp();
     printf ("Transfer successful!\n");
     dt=t1-t0;
     printf("dma dword transmit: size=0x%x t0=%ld t1=%ld dt=%ld time=%fs\n", size_byte,t0,t1,dt,(double)dt/timestamp_freq);
     */
     //-----------------------------------------------------------
     //�ر�DMA�����ŵ�
	while(1)
	{
		int i;
		if(tx_done=1)
		{
			tx_done=0;
			alt_dma_txchan_ioctl(txchan,  ALT_DMA_TX_ONLY_ON, ddr_dword2);
			alt_dma_txchan_send(    txchan,
										 ddr_dword1,
										 size_byte,
										 done,
										  NULL);
			i++;
			printf("dma transmit successful ,count=%5d\n",i);
		}
	}
     alt_dma_txchan_close(txchan);


     return 0;

}