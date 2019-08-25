# -*- coding: utf-8 -*-
"""
Created on Fri Jul 19 15:19:22 2019

@author: sabari
"""

# -*- coding: utf-8 -*-
"""
Created on Sun Jul  7 21:29:39 2019

@author: sabari
"""

import cv2
import numpy as np
import os

import pandas as pd


import numpy as np
from scipy.ndimage import zoom


def clipped_zoom(img, zoom_factor, **kwargs):

    h, w = img.shape[:2]

    # For multichannel images we don't want to apply the zoom factor to the RGB
    # dimension, so instead we create a tuple of zoom factors, one per array
    # dimension, with 1's for any trailing dimensions after the width and height.
    zoom_tuple = (zoom_factor,) * 2 + (1,) * (img.ndim - 2)

    # Zooming out
    if zoom_factor < 1:

        # Bounding box of the zoomed-out image within the output array
        zh = int(np.round(h * zoom_factor))
        zw = int(np.round(w * zoom_factor))
        top = (h - zh) // 2
        left = (w - zw) // 2

        # Zero-padding
        out = np.zeros_like(img)
        out[top:top+zh, left:left+zw] = zoom(img, zoom_tuple, **kwargs)

    # Zooming in
    elif zoom_factor > 1:

        # Bounding box of the zoomed-in region within the input array
        zh = int(np.round(h / zoom_factor))
        zw = int(np.round(w / zoom_factor))
        top = (h - zh) // 2
        left = (w - zw) // 2
        
        
        out = zoom(img[top:top+zh, left:left+zw], zoom_tuple, **kwargs)

        # `out` might still be slightly larger than `img` due to rounding, so
        # trim off any extra pixels at the edges
        trim_top = ((out.shape[0] - h) // 2)
        trim_left = ((out.shape[1] - w) // 2)
        out = out[trim_top:trim_top+h, trim_left:trim_left+w]

    # If zoom_factor == 1, just return the input array
    else:
        out = img
    return out


from custom_dataaugmentation import hflip,blur ,salt_pepper_noise ,clahe,random_brightness ,rotate ,vflip

#imageName=os.listdir('D:/Research/Medical/CHOS_TRAIN/Validation/Image/')


imagePath='D:/Research/Ultrasound/train_aug/Benign/Image/'
maskPath='D:/Research/Ultrasound/train_aug/Benign/Mask/'


#train_set= pd.read_csv('D:/Research/Medical/trainingFile_X_train.csv')

imageName=os.listdir('D:/Research/Ultrasound/train/Benign/Image/')
#groundName=train_set.ground_name.values
 
for row in range(len(imageName)):
    imr=cv2.imread('D:/Research/Ultrasound/train/Benign/Image/'+imageName[row])
    
#    hr=hflip(imr)
#    hr=blur(imr,10)
#    cv2.imwrite(imagePath+'hflip_'+str(row)+'.jpg',hr)


    maskImage=cv2.imread('D:/Research/Ultrasound/train/Benign/Mask/'+imageName[row])
    
#    maskI =hflip(maskImage)
    
#    cv2.imwrite(maskPath+'hflip_'+str(row)+'.jpg',maskI)

    print(row)
    
    
##    hrImg=blur(imr,12)
##    hrImg=random_brightness(imr,0.5)
#    
#    hrImg=clipped_zoom(imr,1.5)
#    cv2.imwrite('E:/FB/Semantic_Segmentation_Dataset/new_aug/aug_image/selected_clipped_zoom_'+str(row)+'.jpg',hrImg)
#    mask=np.load('E:/FB/Semantic_Segmentation_Dataset/new_aug/labels/'+imageName[row][0:-3]+'npy')
##    hrImg_mask=blur(mask)
##    hr_mask=hflip(mask)
#    hfmask=clipped_zoom(mask,1.5)
#    np.save('E:/FB/Semantic_Segmentation_Dataset/new_aug/aug_labels/selected_clipped_zoom_'+str(row)+'.npy',hfmask)
#    print(row)

#    imr=cv2.imread('E:/FB/Semantic_Segmentation_Dataset/new_aug/images/'+imageName[row])
#
#
#    mask=np.load('E:/FB/Semantic_Segmentation_Dataset/new_aug/labels/'+imageName[row][0:-3]+'npy')
#    print(row)
    for angle in range(-90,90,5):
#        
        if angle !=0:
            rotatedImage=rotate(imr,angle)
            rotatedMask=rotate(maskImage,angle)
            
            cv2.imwrite(imagePath+'selected_rotatedImage_'+str(row)+'_'+str(angle)+'.jpg',rotatedImage)
            cv2.imwrite(maskPath+'selected_rotatedImage_'+str(row)+'_'+str(angle)+'.jpg',rotatedMask)


#            cv2.imwrite('E:/FB/Semantic_Segmentation_Dataset/new_aug/aug_image/selected_rotatedImage_'+str(row)+'_'+str(angle)+'.jpg',rotatedImage)
#            np.save('E:/FB/Semantic_Segmentation_Dataset/new_aug/aug_labels/selected_rotatedImage_'+str(row)+'_'+str(angle)+'.npy',rotatedMask)
#
#
#

