//Stitch together all the Alice dresses and make an opengraph thumbnail
//Rerun this after adding a new dress so that it shows up.

int main() {
	string data = Stdio.read_file("AliceDresses.md");
	array(string) images = ({ });
	while (sscanf(data, "%*s\n![%*[^]\n]](%[^)\n])%s", string img, data) && img) {
		sscanf(img, "images/%*s_by_%s", string authorext);
		string hires = "../CJAPrivate/Commissions/alice_by_" + authorext; //It might be available in higher resolution.
		if (file_stat(hires)) images += ({hires});
		else images += ({img});
	}
	Image.Image canvas = Image.Image(1200, 630); //The dimensions of this desolate tract are unknown to all but the folks who make recommendations about OpenGraph images.
	//Rescale every image to be 630px high, then see how much room they want in total.
	//If there's spare room, leave black gaps between them; if not, overlap them, with the
	//newer images on top of older ones.
	array(Image.Image) img = Image.ANY.decode(Stdio.read_file(images[*])[*])->scale(0, canvas->ysize());
	//Since there's potentially a LOT of overlap required, split it three ways: crop left,
	//crop right, and overlap. This should give a better-looking result. Note that the crop
	//is an *average*, and the images will all be cropped to the same exact size. (Also, the
	//crop is slightly offset and the left/right are not quite equal.)
	int overlap = (`+(@img->xsize()) - canvas->xsize()) / sizeof(img) / 3;
	int target_width = canvas->xsize() / sizeof(img) + overlap;
	int xpos = 0;
	foreach (img, Image.Image image) {
		int crop = (image->xsize() - target_width + overlap) / 2;
		image = image->copy(crop, 0, crop + target_width - 1, image->ysize() - 1);
		canvas->paste(image, xpos, 0);
		xpos += image->xsize() - overlap;
	}
	Stdio.write_file("images/dresses_combined.png", Image.PNG.encode(canvas));
}
