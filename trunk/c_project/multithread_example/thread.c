#include <errno.h>    
#include <fcntl.h>      
#include <pthread.h>
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>
#include <sys/ioctl.h>  
#include <sys/stat.h>   
#include <sys/types.h>  
#include <termios.h>   
#include <unistd.h>  

int fd;
char* buf;
const int buflen = 5 * 1024 * 1024;

int init_env(char* filename)
{
	fd = open(filename, O_RDWR);
	printf("mz_debug_msg %s %d, fd:%d\n", __func__, __LINE__, fd);

	buf = malloc(buflen);
	if (buf) {
		printf("mz_debug_msg %s %d, buf:%p\n", __func__, __LINE__, buf);

		/* set to 'a' */
		memset(buf, 0x61, buflen); 

		do {
			int i;
			char* tmp;
			char cmd[6] = "ate0\r\n";
			
			tmp = buf;
			printf("mz_debug_msg %s %d\n", __func__, __LINE__);
                        /*
			 *for (i = 0; i < buflen/4; i++) {
			 *        [>printf("mz_debug_msg %s %d, tmp:%p, i:%d, cmd:%p\n", __func__, __LINE__, tmp, i, cmd);<]
			 *        memcpy(tmp, cmd, 4);
			 *        tmp += 4;
			 *}
                         */
			 memcpy(tmp, cmd, 4);
			printf("mz_debug_msg %s %d\n", __func__, __LINE__);
		} while(0);
		printf("mz_debug_msg %s %d\n", __func__, __LINE__);
	} 

	return 0;
}

int task1(int *ret)  
{
	// close fd
	printf("mz_debug_msg %s %d\n", __func__, __LINE__);
	sleep(1);  
	printf("mz_debug_msg %s %d\n", __func__, __LINE__);
	if (fd)
		*ret = close(fd);
	printf("mz_debug_msg %s %d, ret:%d\n", __func__, __LINE__, *ret);
	printf("mz_debug_msg %s %d\n", __func__, __LINE__);

	return 0;

}  

int task2(int* ret)  
{  
	int cnt;

	printf("mz_debug_msg %s %d, ret:%d\n", __func__, __LINE__, *ret);
	/*sleep(1);*/
	do {
		int i = 0;

		for (i = 0; i < 500; i ++ ) {
			/*cnt = write(fd, buf, buflen);*/
			cnt = write(fd, "ate0\r\n", 6);
			if (cnt < 0) {
				printf("mz_debug_msg %s %d, i:%d, cnt:%d\n", __func__, __LINE__, i, cnt);
				break;
			} else {
				printf("mz_debug_msg %s %d, i:%d, cnt:%d\n", __func__, __LINE__, i, cnt);
			}
			sleep(1);
		}

		printf("mz_debug_msg %s %d, cnt:%d\n", __func__, __LINE__, cnt);
	} while(0);
	
	printf("mz_debug_msg %s %d, ret:%d\n", __func__, __LINE__, *ret);

	printf("mz_debug_msg %s %d, ret:%p\n", __func__, __LINE__, ret);
	*ret = cnt;

	return 0;
}  

int  main(int argc, char* argv[])  
{  
	int result;  
	int t1 = 1;  
	int t2 = 2;  
	int rt1, rt2;  

	pthread_t thread1, thread2;  

	if (argc != 2) {
		printf("mz_debug_msg %s %d, must predicate filename!!\n", __func__, __LINE__);
		exit(1);
	}

	init_env(argv[1]);

	/* create the first thread.*/  
	result = pthread_create(&thread1, PTHREAD_CREATE_JOINABLE, (void*)task1,(void*)&t1 );  
	if(result)  
	{  
		perror("pthread_create: task1.\n");  
		exit(EXIT_FAILURE);  
	}  

	//created the second thread  
	result = pthread_create(&thread2, PTHREAD_CREATE_JOINABLE,(void*)task2, (void*)&t2 );  
	if(result)  
	{  
		perror("pthread_create:task2.\n");  
		exit(EXIT_FAILURE);  
	}  

	pthread_join(thread1, (void *) &rt1);  
	pthread_join(thread2, (void *) &rt2);  
	
	printf("mz_debug_msg %s %d, &t2:%p\n", __func__, __LINE__, &t2);
	printf("get value of task1: %d\n", t1);  
	printf("get value of task2: %d.\n", t2);  

	printf("return value of task1: %d\n", rt1);  
	printf("return value of task2: %d.\n", rt2);  

	exit(EXIT_SUCCESS);  

}

