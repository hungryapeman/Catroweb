<?php

namespace App\Api\Services\Projects;

use App\Api\Services\Base\AbstractRequestValidator;
use App\Api\Services\ValidationWrapper;
use App\Entity\UserManager;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

final class ProjectsRequestValidator extends AbstractRequestValidator
{
  private UserManager $user_manager;

  public function __construct(ValidatorInterface $validator, TranslatorInterface $translator, UserManager $user_manager)
  {
    parent::__construct($validator, $translator);

    $this->user_manager = $user_manager;
  }

  public function validateUserExists(string $user_id): bool
  {
    return '' !== trim($user_id)
      && !ctype_space($user_id)
      && null !== $this->user_manager->findOneBy(['id' => $user_id]);
  }

  public function validateUploadFile(string $checksum, UploadedFile $file, string $locale): ValidationWrapper
  {
    $KEY = 'error';

    if (!$file->isValid()) {
      return $this->getValidationWrapper()->addError(
        $this->__('api.projectsPost.upload_error', [], $locale), $KEY
      );
    }

    $calculated_checksum = md5_file($file->getPathname());
    if (strtolower($calculated_checksum) != strtolower($checksum)) {
      return $this->getValidationWrapper()->addError(
        $this->__('api.projectsPost.invalid_checksum', [], $locale), $KEY
      );
    }

    return $this->getValidationWrapper();
  }
}
